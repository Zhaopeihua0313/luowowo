public class LinkedList<E> extends AbstractList<E> {
	/**
	 * 头结点（第一个结点）
	 */
	private Node<E> first;

	public E get(int index) {
		rangeCheck(index);
		return node(index).element;
	}

	public E set(int index, E element) {
		rangeCheck(index);
		Node<E> node = node(index);
		E oldElement = node.element;
		node.element = element;
		return oldElement;
	}

	public void add(int index, E element) {
		rangeCheckForAdd(index);
		if (first == null) {
			first = new Node<E>(element, null);
		} else if (index == 0) {
			Node<E> newNode = new Node<E>(element, null);
			newNode.next = first;
			first = newNode;
		} else {
			Node<E> prevNode = node(index - 1);
			Node<E> newNode = new Node<E>(element, null);
			newNode.next = prevNode.next;
			prevNode.next = newNode;
		}
		size++;
	}

	public E remove(int index) {
		rangeCheck(index);
		E oldElement = null;
		if (index == 0) {
			oldElement = first.element;
			first = first.next;
		} else {
			Node<E> prevNode = node(index - 1);
			oldElement = prevNode.next.element;
			prevNode.next = prevNode.next.next;
		}
		size--;
		return oldElement;
	}

	public int indexOf(E element) {
		Node<E> node = first;
		if (element == null) {
			for (int i = 0; i < size; i++) {
				if (node.element == null) return i;
				node = node.next;
	 		}
		} else {
			for (int i = 0; i < size; i++) {
				if (element.equals(node.element)) return i; 
				node = node.next;
	 		}
		}
		return ELEMENT_NOT_FOUND; 
	}

	public void clear() {
		size = 0;
		first = null;
	}
	
	@Override
	public String toString() {
		// size=10,[11,22,33]
		StringBuilder sb = new StringBuilder();
		sb.append("size=").append(size).append(", ");
		sb.append("[");
		Node<E> node = first;
		for (int i = 0; i < size; i++) {
			sb.append(node.element).append(",");
			node = node.next;
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("]");
		return sb.toString();
	}
	
	private Node<E> node(int index) {
		Node<E> node = first;
		for (int i = 0; i < index; i++) {
			node = node.next;
		}
		return node;
	}
	
	private static class Node<E> {
		private E element;
		private Node<E> next;
		public Node(E element, Node<E> next) {
			this.element = element;
			this.next = next;
		}
	}
}
