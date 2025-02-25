import csv
import hashlib
import random
from datetime import datetime

import faker_commerce
from faker import Faker
from keboola.component import CommonInterface

fk = Faker()
fk.add_provider(faker_commerce.Provider)
ci = CommonInterface()
ROWS = 10000

print('Customers')
file = ci.create_out_table_definition('customers.csv')
with open(file.full_path, 'w+', newline='') as users:
    pr = fk.profile()
    header = list(pr.keys())
    header.append('pk')
    writer = csv.DictWriter(users, header)
    writer.writeheader()
    customers = []
    for i in range(ROWS):
        pr = fk.profile()

        pr['pk'] = hashlib.md5(pr['mail'].encode()).hexdigest()
        customers.append(pr['pk'])
        writer.writerow(pr)


print('Orders')
file = ci.create_out_table_definition('orders.csv')
with open(file.full_path, 'w+', newline='') as orders:
    header = ['order_id', 'customer_id', 'date', 'product', 'price', 'quantity']
    header.append('pk')
    writer = csv.DictWriter(orders, header)
    writer.writeheader()
    for i in range(100):
        r = dict()
        r['order_id'] = i
        r['customer_id'] = random.choice(customers)
        r['date'] = fk.date_between_dates(
            date_start=datetime(2021, 1, 1),
            date_end=datetime(2022, 9, 15))
        r['product'] = fk.ecommerce_name()
        r['quantity'] = random.randint(1, 10)
        r['price'] = r['quantity'] * fk.ecommerce_price()

        writer.writerow(r)


print('Done')
