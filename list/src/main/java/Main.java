public class Main {

	public static void main(String[] args) {
		DoublyLinkedList<Integer> list = new DoublyLinkedList<Integer>();
		list.add(11);
		list.add(22);
		list.add(33);
		list.add(0, 44);
		list.add(3, 55);
		list.add(5, 66);
		list.reverseAdd(0,77);
 		list.reverseAdd(3,88);
		list.reverseAdd(5,99);
		list.reverseAdd(8,100);
		list.remove(4);
		// 44, 11, 22, 55, 66
		// 100, 44, 99, 11, 22, 88, 55, 66, 77

		Asserts.test(list.size() == 5);
		Asserts.test(list.size() == 8);
		Asserts.test(list.get(0) == 44);
		Asserts.test(list.get(0) == 100);
		Asserts.test(list.contains(88) == false);
		Asserts.test(list.indexOf(22) == 2);
		System.out.println(list);
	}

}
