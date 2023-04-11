from random import random, shuffle
import tabulate

class Pub:

    def __init__(self, pub_name):
        self.name = pub_name
        self.visitors = set()
        self.fans_percent = 0.0
        self.blacklist = set()

    # внести посетителя в список гостей / не впустить внутрь
    def add_visitor(self, visitor):
        if visitor.full_name not in self.blacklist:
            self.visitors.add(visitor)
            print("Welcome {1} {0}!".format(visitor.full_name[0], visitor.full_name[1]))
            return True
        else:
            print("Get out of here {1} {0}!".format(visitor.full_name[0], visitor.full_name[1]))
            return False

    # удалить посетителя из списка гостей, попрощаться
    def del_visitor(self, visitor=None):
        if len(self.visitors) == 0:
            print("There is no visitors :(")
            return None
        if visitor is None:
            visitor = self.visitors.pop()
        else:
            self.visitors.remove(visitor)
        print("Ciao, {1} {0}!".format(visitor.full_name[0], visitor.full_name[1]))

    # вышвырнуть посетителя
    def throw(self, visitor):
        self.visitors.remove(visitor)
        self.blacklist.add(visitor)
        print("Get out of here {1} {0}!".format(visitor.full_name[0], visitor.full_name[1]))

    # поддержать клич вошедшего
    def repeat(self):
        for visitor in self.visitors:
            if visitor.is_fan:
                if visitor.lives < 4:
                    visitor.repeat()
            else:
                if not(visitor.become_fan()):
                    visitor.lives -= 1
                    if visitor.lives < 1:
                        self.throw(visitor)
                        break

    def show_visitors_list(self):
        visitors_list = []
        for visitor in self.visitors:
            row = [visitor.name, visitor.surname, visitor.is_fan*'Dynamo fan', visitor.lives*'●']
            visitors_list.append(row)
        head = ['NAME', 'SURNAME', 'FAN', 'LIVES']
        print(tabulate.tabulate(visitors_list, headers=head))


class Visitor:

    def __init__(self, name, surname, is_fan=False):
        self.name = name
        self.surname = surname
        self.full_name = (name, surname)
        self.is_fan = is_fan
        self.area = None
        self.lives = 4

    # кликнуть
    def shout(self):
        if self.is_fan:
            print("{0} {1}: Dynamo is the champion!!!".format(self.name, self.surname))
            self.area.repeat()

    # поддержать чужой клич
    def repeat(self):
        if self.is_fan:
            print("{0} {1}: Dynamo is the champion!!!".format(self.name, self.surname))

    # стать фанатом
    def become_fan(self):
        if random() > 0.5:
            self.is_fan = True
            self.repeat()
            return True

        return False

    # войти в бар
    def enter_pub(self, pub_name):
        if pub_name.add_visitor(self):
            self.area = pub_name
            self.shout()
            self.lives -= 1

    # выйти из бара
    def exit_pub(self):
        self.area.del_visitor(self)
        self.area = None


#code

names = ['Aaron', 'Abraham', 'Adam', 'Adrian', 'Aidan', 'Alan', 'Albert', 'Alejandro',
         'Alex', 'Alexander', 'Alfred', 'Andrew', 'Angel', 'Anthony', 'Antonio', 'Ashton', 'Austin']

surnames = ['Black', 'Smith', 'Cox', 'Bush', 'Fry', 'Laurie', 'Shwartz']

people = []

for name in names:
    for surname in surnames:
        people.append((name, surname))

shuffle(people)

visitors = set()
for p in people:
    visitors.add(Visitor(p[0], p[1], random() > 0.75))

dynamo_pub = Pub('Dynamo')

while True:
    print('waiting command...')
    text = input()
    if text == 'stop':
        break
    elif text == '+':
        next = visitors.pop()
        next.enter_pub(dynamo_pub)
    elif text == "-":
        dynamo_pub.del_visitor()
    elif text == 'show':
        dynamo_pub.show_visitors_list()



