package com.kl.napchen.store.test;

import org.junit.Test;

public class TestClass {

	@Test
	public void TestRun() throws InterruptedException {
		InnerOne innerOne1 = new InnerOne("张三");
		InnerOne innerOne2 = new InnerOne("李四");

		Thread th1 = new Thread(innerOne1);
		Thread th2 = new Thread(innerOne2);

		th1.start();
		th2.start();

		th1.join();
		th2.join();
	}

	public class InnerOne implements Runnable {
		String name;

		public InnerOne() {
			super();
		}

		public InnerOne(String name) {
			this.name = name;
		}

		@Override
		public void run() {
			for (int i = 0; i < 20; i++) {
				for (long k = 0; k < 10000000; k++)
					System.out.println(name + ": " + i);
				System.out.println(Thread.currentThread());
			}
		}

	}

	public class InnerTwo implements Runnable {

		@Override
		public void run() {

		}

	}
}
