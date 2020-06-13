@SuppressWarnings("unchecked")
public class ArrayList<E> extends AbstractList<E> {
	private static final int DEFAULT_CAPACITY = 10;
	/**
	 * 用来存放所有的元素
	 */
	private E[] elements;
	
	public ArrayList() {
		this(0);
	}
	
	public ArrayList(int capacity) {
		if (capacity <= DEFAULT_CAPACITY) {
			elements = (E[]) new Object[10];
		} else {
			elements = (E[]) new Object[capacity];
		}
	}

	public E get(int index) {
		rangeCheck(index);
		return elements[index];
	}

	public E set(int index, E element) {
		rangeCheck(index);
		E oldElement = elements[index];
		elements[index] = element;
		return oldElement;
	}

	public void add(int index, E element) {
		rangeCheckForAdd(index);
		// 保证容量足够
		ensureCapacity(size + 1);
		
		// 将 index ~ size - 1 范围的元素向后移动一个单位
		for (int i = size - 1; i >= index; i--) {
			elements[i + 1] = elements[i];
		}
		// 存放新的元素
		elements[index] = element;
		// 数量增加
		size++;
	}

	public E remove(int index) {
		rangeCheck(index);
		E oldElement = elements[index];
		for (int i = index + 1; i < size; i++) {
			elements[i - 1] = elements[i];
		}
		elements[--size] = null;
		return oldElement;
	}

	public int indexOf(E element) {
		if (element == null) { // 1
			for (int i = 0; i < size; i++) {
				if (elements[i] == null) return i; // n
	 		}
		} else {
			for (int i = 0; i < size; i++) {
				if (element.equals(elements[i])) return i; // n
	 		}
		}
		return ELEMENT_NOT_FOUND; // 1 + n
	}
	
//	public int indexOf2(E element) {
//		for (int i = 0; i < size; i++) { // n
//			if (element == elements[i]) return i;
//			if (element != null && element.equals(elements[i])) return i;
// 		} // 3n
//		return ELEMENT_NOT_FOUND;
//	}

	public void clear() {
		for (int i = 0; i < size; i++) {
			elements[i] = null;
		}
		size = 0;
	}
	
	@Override
	public String toString() {
		// size=10,[11,22,33]
		StringBuilder sb = new StringBuilder();
		sb.append("capacity=").append(elements.length).append(", ");
		sb.append("size=").append(size).append(", ");
		sb.append("[");
		for (int i = 0; i < size; i++) {
//			if (i != 0) {
//				sb.append(",");
//			}
			sb.append(elements[i]).append(",");
//			if (i != size - 1) {
//				sb.append(",");
//			}
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("]");
		return sb.toString();
	}
	
	/**
	 * 保证数组的容量 >= capacity
	 */
	private void ensureCapacity(int capacity) {
		if (elements.length >= capacity) return;
		int newCapacity = elements.length + (elements.length >> 1);
		E[] newElements = (E[]) new Object[newCapacity];
		for (int i = 0; i < size; i++) {
			newElements[i] = elements[i];
		}
		elements = newElements;
	}
}
