from pprint import pprint
import csv
import io
import re
import os
import operator
import itertools

with io.open("phonebook_raw.csv", encoding='utf-8') as f:
  rows = csv.reader(f, delimiter=",")
  contacts_list = list(rows)


## 1. Выполните пункты 1-3 задания.
def csv_to_dict(file_name):
  contact_dict = []
  with open(file_name, encoding='utf-8') as f:
    reader = csv.reader(f, delimiter=',')
    contact_list = list(reader)

    keys = contact_list[0]
    values = contact_list[1:]
    for name, infos in enumerate(values):
      contact_dict.append({})
      for key, info in zip(keys, infos):
        contact_dict[name].update({key: info})
    return contact_dict


def delete_dup(in_file):
    contact_dict = csv_to_dict(in_file)
    for names in contact_dict:
      splitted = names['lastname'].split(' ')
      if len(splitted) > 1:
        names['lastname'] = splitted[0]
        names['firstname'] = splitted[1]
        if len(splitted) > 2:
          names['surname'] = splitted[2]
      
      splitted = names['firstname'].split(' ')
      
      if len(splitted) > 1:
        names['firstname'] = splitted[0]
        names['surname'] = splitted[1]
    
    return contact_dict


def fix_phones(in_file, out_file):
    with open(in_file, encoding="utf8") as f:
        text = f.read()

    phone_pattern = r'(\+7|8)?\s*\(?(\d{3})\)?[\s*-]?(\d{3})[\s*-]?(\d{2})[\s*-]?(\d{2})(\s*)\(?(доб\.?)?\s*(\d*)?\)?'
    fixed_phone = re.sub(phone_pattern, r'+7(\2)\3-\4-\5\6\7\8', text)
    with open(out_file, 'w+', encoding="utf8") as f:
        text = f.write(fixed_phone)




def merge_names(contacts):
    all_keys = set(contacts[0].keys())
    group_list = ['firstname', 'lastname']
    group = operator.itemgetter(*group_list)
    cols = operator.itemgetter(*(all_keys ^ set(group_list)))
    contacts.sort(key=group)
    grouped = itertools.groupby(contacts, group)

    merge_data = []
    for (firstname, lastname), g in grouped:
        merge_data.append({'lastname': lastname, 'firstname': firstname})
        for gr in g:
            d1 = merge_data[-1]
            for k, v in gr.items():
                if k not in d1 or d1[k] == '':
                    d1[k] = v

    return merge_data




def dicts_to_file(file_name, dicts):
  keys = list(dicts[0].keys())
  with open(file_name, 'w', encoding='utf-8') as f:
    datawriter = csv.writer(f, delimiter=',')
    datawriter.writerows(keys)
    for d in dicts:
      datawriter.writerow(d.values())







if __name__ == '__main__':
   fix_phones(in_file = 'phonebook_raw.csv', out_file='fixed_phone.csv')
   fixed_names = delete_dup(in_file = 'fixed_phone.csv')
   os.remove('fixed_phone.csv')
   merged_data = merge_names(fixed_names)
   dicts_to_file("phonebook.csv", merged_data)
