from collections import defaultdict
from models import db
from models.product import Product


class TrieNode:
    def __init__(self):
        self.children = defaultdict(TrieNode)  # Use TrieNode as the default factory
        self.is_end = False
        self.products_id = []


class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word, product_id):
        assert isinstance(word, str)
        node = self.root
        for char in word:
            node = node.children[char]  # Automatically creates TrieNode if not present
        node.is_end = True
        node.products_id.append(product_id)

    def search(self, prefix):
        assert isinstance(prefix, str)
        node = self.root
        for char in prefix:
            if char not in node.children:
                return []
            node = node.children[char]
        return self._find_products_with_prefix(node)

    def _find_products_with_prefix(self, node):
        results = []
        if node.is_end:  # Fixed attribute name
            results.extend(node.products_id)
        for child in node.children.values():
            results.extend(self._find_products_with_prefix(child))
        return results


class SearchService:
    def __init__(self):
        self.trie = Trie()

    def populate(self):
        products = db.session.query(Product).all()  # Fetch all products from the database
        for product in products:
            # Insert both product name and tag into the trie for searching
            self.trie.insert(product.name.lower(), product.id)
            self.trie.insert(product.tag.lower(), product.id)
        print("Search service populated successfully.")

    def search(self, query):
        return self.trie.search(query.lower())  # Ensure the query is in lowercase for case-insensitive search
