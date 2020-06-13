public abstract class AbstractList<E> implements List<E> {
	protected static final int ELEMENT_NOT_FOUND = -1;
	/**
	 * 元素的数量
	 */
	protected int size;

	public int size() {
		return size;
	}

	public boolean isEmpty() {
		return size == 0;
	}

	public boolean contains(E element) {
		return indexOf(element) != ELEMENT_NOT_FOUND;
	}

	public void add(E element) {
		add(size, element);
	}
	
	protected void rangeCheck(int index) {
		// 0 ~ size - 1
		if (index < 0 || index >= size) {
			throw new IllegalArgumentException("index is out of bounds.");
		}
	}
	
	protected void rangeCheckForAdd(int index) {
		// 0 ~ size
		if (index < 0 || index > size) {
			throw new IllegalArgumentException("index is out of bounds.");
		}
	}

}
