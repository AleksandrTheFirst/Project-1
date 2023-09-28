from pprint import pprint
## Читаем адресную книгу в формате CSV в список contacts_list:
import csv
import re
import io 



def fix_contacts(contacts_list):
  for item in contacts_list:
    contact_fullname = ' '.join(item[:3]).split('  ')
    return contact_fullname


# full_fio = {}
# def fix_duplicate(contacts_list):
#   fixed_contacts = []
#   first_names = []
#   surnames = []
#   for item in contacts_list:
#     lastnames = item[0]
#     separated_last = lastnames.split()
#     if len(separated_last) > 1:
#       first_names.append(separated_last[1])
#       separated_last.pop(1)
#       if len(separated_last) > 1:
#         surnames.append(separated_last[1])
#         separated_last.pop(1)
#     if separated_last[0] == 'lastname':
#       separated_last.pop(0)
#     for i in separated_last:
#       fixed_contacts.append(i)
#   full_fio.update({'lastname': fixed_contacts, 'firstname': first_names, 'surname': surnames})
#   print(full_fio)


    
complete = {}
def delete_dup(contacts_list):
    for contact in contacts_list:
      information = contact[0:]
      fio = ' '.join(contact[:3]).split()
      contact[:len(fio)] = fio
      names = contact[0]
      if names not in complete:
        complete.update({names:information})
      if names not in complete:
        complete.update({names: information})
        print(information)
      else:
        for i, value in enumerate(complete[names]):
          if not value:
            complete[names][i] = information[i]
    for i, value in complete.items():
      contact_list_updated.append(value)
    return contact_list_updated
    # for contacted in contact_list_updated:
    #   splitted = ' '.join(contacted[:3]).split()
    #   contact[:len(splitted)] = splitted
    #   contact_list_updated.append(splitted)
    # return splitted


        



def fix_phones(contacts_list):
  phone_pattern = re.compile(r'(\+7|8)?\s*\(?(\d{3})\)?\s*\D?(\d{3})[-\s+]?(\d{2})-?(\d{2})((\s)?\(?(доб.)?\s?(\d+)\)?)?')
  phone_substitution = r'+7-(\2) \3-\4-\5'
  
  for phones in contacts_list:
    broken = phones[5]
    if broken == 'phone':
      phones.remove('phone')
    else:
      fixed_phone = re.sub(phone_pattern, phone_substitution, broken).split()
      return fixed_phone




if __name__ == '__main__':
  with io.open("phonebook_raw.csv", encoding='utf-8') as f:
    rows = csv.reader(f, delimiter=",")
    contacts_list = list(rows)
    contact_list_updated = []
    fix_contacts(contacts_list)
    fix_phones(contacts_list)
    delete_dup(contacts_list)
  
  with open("phonebook.csv", "w", encoding='utf-8') as out_file:
    datawriter = csv.writer(out_file, delimiter=',')
    datawriter.writerows(contact_list_updated)
  pprint(contact_list_updated)
