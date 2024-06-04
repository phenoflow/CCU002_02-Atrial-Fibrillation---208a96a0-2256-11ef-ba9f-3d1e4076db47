# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"5370000","system":"snomedct"},{"code":"15964901000119107","system":"snomedct"},{"code":"720448006","system":"snomedct"},{"code":"164890007","system":"snomedct"},{"code":"428076002","system":"snomedct"},{"code":"195080001","system":"snomedct"},{"code":"I48","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-atrial-fibrillation-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_02-atrial-fibrillation-af-flutter---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_02-atrial-fibrillation-af-flutter---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_02-atrial-fibrillation-af-flutter---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
