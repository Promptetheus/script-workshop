import networkx as nx
import matplotlib.pyplot as plt

def node_parser(diagram):
    nodes = []
    for node in diagram:
        nodes.append(node['id'])
    return nodes

def connection_generator(nodes, diagram):
    connections = []
    for i in range(len(nodes) - 1):
        if diagram[nodes[i]]['type'] == diagram[nodes[i + 1]]['type']:
            connections.append((nodes[i], nodes[i + 1]))
    return connections

def connection_validator(connections, diagram):
    valid_connections = []
    for connection in connections:
        if nx.has_edge(connection[0], connection[1], diagram):
            valid_connections.append(connection)
    return valid_connections

def connection_renderer(diagram, connections):
    G = nx.Graph()
    for node in diagram:
        G.add_node(node['id'], type=node['type'])
    for connection in connections:
        nx.draw_networkx_edges(G, pos=nx.spring_layout(G), edgelist=[connection], edge_color='r')
    plt.show()

def error_handler(connections, diagram):
    if len(connections) == 0:
        print("No connections to render.")
    else:
        connection_renderer(diagram, connections)

def main():
    diagram = [
        {'id': 'A', 'type': 'A'},
        {'id': 'B', 'type': 'B'},
        {'id': 'C', 'type': 'C'},
        {'id': 'D', 'type': 'D'}
    ]
    nodes = node_parser(diagram)
    connections = connection_generator(nodes, diagram)
    valid_connections = connection_validator(connections, diagram)
    error_handler(valid_connections, diagram)

if __name__ == "__main__":
    main()