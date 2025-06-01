import sys
from collections import deque

# 입력 빠르게 받기
input = sys.stdin.readline

# 정점, 간선, 시작 정점
n, m, v = map(int, input().split())

# 인접 리스트 초기화
graph = [[] for _ in range(n + 1)]

# 간선 입력 받아 양방향 연결
for _ in range(m):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)

# 정점 번호가 작은 것부터 방문하기 위해 정렬
for g in graph:
    g.sort()

# DFS (재귀)
def dfs(node, visited):
    visited[node] = True
    print(node, end=' ')
    for neighbor in graph[node]:
        if not visited[neighbor]:
            dfs(neighbor, visited)

# BFS (큐)
def bfs(start):
    visited = [False] * (n + 1)
    queue = deque([start])
    visited[start] = True

    while queue:
        node = queue.popleft()
        print(node, end=' ')
        for neighbor in graph[node]:
            if not visited[neighbor]:
                visited[neighbor] = True
                queue.append(neighbor)

# DFS 수행
visited_dfs = [False] * (n + 1)
dfs(v, visited_dfs)
print()

# BFS 수행
bfs(v)
