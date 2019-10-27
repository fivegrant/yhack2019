"""
separate_addresses.py: parse address line into 3 different columns
Authors: Stacy & Cedric
Date: 10/26/19
"""


def add_address_to_lists():

    house_number = ""
    house_number_list = []
    street = ""
    street_list = []
    unit = ""
    unit_list = []
    number_list = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ordinal_list = ["ST", "ND", "RD", "TH"]

    file = open('OccupantAddresses.csv', 'r', encoding='utf-8-sig')

    for line in file:  # iterating over every line
        # Special case: If it's a PO Box, add the number to 'house number' column and 'PO Box' to street
        if "PO BOX" in line:
            for x in line.split():
                if x.isdigit():
                    house_number_list.append(x)
            street_list.append("PO BOX")
            unit_list.append("NULL")

        # If not, search by 'space'
        elif " " in line:

            # if it has a mixed number in the address line
            if "1/2" in line:
                space = line.index(" ")
                space = line.index(" ", space + 1)
                house_number += line[0:space]

            else:
                space = line.index(" ")
                house_number += line[0:space]

            #  if there's a number inside the string AND it's not part of the ordinal indicator:
            if any(y in house_number for y in number_list) and (any(y in house_number for y in ordinal_list) is False):
                house_number_list.append(house_number)
                house_number = ""

                #  append the 'pound' sign for unit column
                if "#" in line:
                    pound = line.index("#")
                    street += line[(space + 1):(pound - 1)]
                    street_list.append(street)
                    street = ""

                    unit += line[pound:len(line)]
                    unit_list.append(unit)
                    unit = ""

                elif "#" not in line:
                    unit_list.append("NULL")
                    street += line[space + 1:len(line)]
                    street_list.append(street)
                    street = ""
            else:
                house_number_list.append("NULL")
                house_number = ""

                if "#" in line:
                    pound = line.index("#")
                    street += line[0:(pound - 1)]
                    street_list.append(street)
                    street = ""

                    unit += line[pound:len(line)]
                    unit_list.append(unit)
                    unit = ""

                elif "#" not in line:
                    unit_list.append("NULL")
                    street += line[0:len(line)]
                    street_list.append(street)
                    street = ""

        else:
            house_number_list.append("NULL")
            street_list.append("NULL")
            unit_list.append("NULL")

    file.close()

    # replace '\n' with empty string
    for x in range(len(street_list)):
        if "\n" in street_list[x]:
            street_list[x] = street_list[x].replace("\n", '')

    # replace '\n' with empty string
    for x in range(len(unit_list)):
        if "\n" in unit_list[x]:
            unit_list[x] = unit_list[x].replace("\n", '')

    return house_number_list, street_list, unit_list


def write_lists_to_csv():

    house_number_list, street_list, unit_list = add_address_to_lists()
    file = open('addresses_separated.csv', 'w')
    file.write("HouseNum,Street,Unit\n")

    # iterate the each element of each list, comma-separated.
    for x in range(len(house_number_list)):
        line = house_number_list[x] + "," + street_list[x] + "," + unit_list[x] + "\n"
        file.write(line)

    file.close()


def main():
    add_address_to_lists()
    write_lists_to_csv()


main()
