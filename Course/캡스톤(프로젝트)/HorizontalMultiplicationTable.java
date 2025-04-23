public class HorizontalMultiplicationTable {
    public static void main(String[] args) {
        // 구구단 출력
        System.out.println("구구단을 가로로 출력합니다:");
        
        for (int i = 1; i <= 9; i++) { // 곱해지는 숫자 (1~9)
            for (int j = 1; j <= 9; j++) { // 단(1단부터 9단까지)
                System.out.printf("%d x %d = %-3d\t", j, i, j * i); // 가로로 출력
            }
            System.out.println(); // 한 줄 출력 후 줄바꿈
        }
    }
}