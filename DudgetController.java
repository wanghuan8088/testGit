
import java.util.concurrent.locks.ReentrantLock;

public class DudgetController implements Runnable {

    /**
     * @param args
     */
    public static void main(String[] args) {
        int threadNumber = 1340;
        for (int i = 0; i < threadNumber; i++) {
            Thread thread = new Thread(new DudgetController());
            thread.start();
        }
    }

    @Override
    public void run() {
        String msg = budgetDeduct(666) ? "成功" : "失败,预算剩余不足";
        System.out.println(Thread.currentThread().getName() + "-扣除 : " + msg + "; 预算剩余 = " + budgetBalance);
    }


    /**
     * 定义变量： 预算剩余budgetBalance
     * 在分布式高并发下, 该变量会被多线程并发访问
     */
    private static int budgetBalance = 888888;
    /**
     * 定义变量： 重入互斥锁lock
     */
    private final ReentrantLock lock = new ReentrantLock();

    /**
     * 扣减预算
     * Desc: 分布式系统用户积分数据存储在多个节点上, 此方法可能会被并发调用
     * @param consumption 当前需要扣减的消耗量
     * @return 预算的扣减是否成功
     */
    public boolean budgetDeduct(int consumption) {

        // 先比较,不加锁
        if (budgetBalance < consumption) {
            // 超扣,当前扣减的消耗量已经大于预算剩余, 扣减失败
            return false;
        }

        lock.lock();  // 加锁, 直到unlock才会释放
        try {
            // 第二次比较
            if (budgetBalance < consumption) {
                // 超扣,当前扣减的消耗量已经大于预算剩余, 扣减失败
                return false;
            }
            // 预算剩余足够扣除, 扣减成功
            budgetBalance = budgetBalance - consumption;
            return true;
        } finally {
            lock.unlock();
        }
    }

}
