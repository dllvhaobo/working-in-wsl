#!/usr/bin/env python3

class father:
    def __init__(self,name,son) -> None:
        self.__name = name
        self.son = son
        pass


class son:
    def __init__(self,name) -> None:
        self.__name = name
        self.content= []

    def append(self, content):
        self.content.append(content)


s1 =son("ziyang")

f1 = father("lv",s1)
f1.son.append("123")
f1.son.append("123")
f1.son.append("123")

#  print(s1.content)
