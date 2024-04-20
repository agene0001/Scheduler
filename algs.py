def bowlingAlg(v):
    b = [0] * (len(v) + 1)
    config = [None] * (len(v))
    ind = 0
    b[len(v) - 1] = max(0, v[len(v) - 1])
    if b[len(v) - 1] != 0:
        config[ind] = len(v) - 1
        ind += 1
    for i in range(len(v) - 2, -1, -1):
        b[i] = max(v[i] + b[i + 1], b[i + 1], v[i] * v[i + 1] + b[i + 2])
        if b[i] == v[i] + b[i + 1]:
            if i not in config:
                config[ind] = i
                ind += 1
        elif b[i] == v[i] * v[i + 1] + b[i + 2]:
            if i not in config:
                config[ind] = i
                ind += 1
            if i + 1 not in config:
                config[ind] = i + 1
                ind += 1
    return b[0], config


def turtle(f):
    b = [0] * (len(f) + 1)
    b[len(f)] = max(0, f[len(f) - 1])

    b[len(f) - 1] = max(0, f[-2] + b[len(f)])

    config = [None] * (len(f) + 1)
    ind = 0
    if b[len(f)] == b[0] + f[1]:
        config[ind] = len(f)
        ind += 1

    if b[len(f) - 1] != 0:
        config[ind] = len(f) - 1
        ind += 1
    for i in range(len(f) - 3, 0, -1):
        print(f'{b[i+2] =}')
        print(f'{b[i+3] =}')
        print(f'{f[i+2] =}')
        if b[i + 2] == b[i + 2] + f[i + 2]:
            if f[i] + f[i + 1] + b[i + 3] > f[i] + b[i + 2]:
                b[i] = max(0, f[i] + b[i + 1], f[i] + f[i + 1] + b[i + 3])
                if b[i] == f[i] + b[i + 1]:
                    config[ind] = i
                    ind+=1
                elif b[i] == f[i] + f[i+1]+b[i+3]:
                    config[ind] = i
                    ind+=1
            else:
                b[i] = max(0, f[i] + b[i + 1], f[i] + f[i+1] + b[i + 2])
                if b[i] == f[i] + b[i + 1]:
                    config[ind] = i
                    ind += 1
                elif b[i] == f[i] + f[i + 1] + b[i + 3]:
                    config[ind] = i
                    ind += 1
        else:
            b[i] = max(0, f[i] + b[i + 1], f[i] + f[i + 1] + b[i + 2])

    return config, b, f
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
# def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:


if __name__ == '__main__':
    bowlingAlg([1, 2, 3, 4, 5])
    print(turtle([12, 14, 16, 0]))
    # print(turtle([12, 14, 6, 12]))
    # print(turtle([0, 14, 6, 12]))
    # print(turtle([12, -14, -6, 12]))
