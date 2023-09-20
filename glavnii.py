import datetime
from salary import calculate_salary
from people import get_employes

dt = datetime.datetime.today()

if __name__ == '__main__':
    calculate_salary(2,2)
    get_employes(3,4)
    print(dt)
