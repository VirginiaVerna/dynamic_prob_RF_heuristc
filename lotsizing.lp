minimize
obj: 2 x_m1,banana,1_ + 10 y_m1,banana,1_ + 2 x_m1,banana,2_ + 10 y_m1,banana,2_ + 2 x_m1,banana,3_ + 10 y_m1,banana,3_ + 2 x_m1,banana,4_ + 10 y_m1,banana,4_ + 2 x_m1,banana,5_ + 10 y_m1,banana,5_ + 2 x_m1,banana,6_ + 10 y_m1,banana,6_ + 2 x_m1,banana,7_ + 10 y_m1,banana,7_ + 2 x_m1,banana,8_ + 10 y_m1,banana,8_ + 2 x_m1,banana,9_ + 10 y_m1,banana,9_ + 2 x_m1,banana,10_ + 10 y_m1,banana,10_ + 3 x_m1,apple,1_ + 8 y_m1,apple,1_ + 3 x_m1,apple,2_ + 8 y_m1,apple,2_ + 3 x_m1,apple,3_ + 8 y_m1,apple,3_ + 3 x_m1,apple,4_ + 8 y_m1,apple,4_ + 3 x_m1,apple,5_ + 8 y_m1,apple,5_ + 3 x_m1,apple,6_ + 8 y_m1,apple,6_ + 3 x_m1,apple,7_ + 8 y_m1,apple,7_ + 3 x_m1,apple,8_ + 8 y_m1,apple,8_ + 3 x_m1,apple,9_ + 8 y_m1,apple,9_ + 3 x_m1,apple,10_ + 8 y_m1,apple,10_ + 1 x_m1,orange,1_ + 6 y_m1,orange,1_ + 1 x_m1,orange,2_ + 6 y_m1,orange,2_ + 1 x_m1,orange,3_ + 6 y_m1,orange,3_ + 1 x_m1,orange,4_ + 6 y_m1,orange,4_ + 1 x_m1,orange,5_ + 6 y_m1,orange,5_ + 1 x_m1,orange,6_ + 6 y_m1,orange,6_ + 1 x_m1,orange,7_ + 6 y_m1,orange,7_ + 1 x_m1,orange,8_ + 6 y_m1,orange,8_ + 1 x_m1,orange,9_ + 6 y_m1,orange,9_ + 1 x_m1,orange,10_ + 6 y_m1,orange,10_ + 0.5 s_banana,1_ + 0.5 s_banana,2_ + 0.5 s_banana,3_ + 0.5 s_banana,4_ + 0.5 s_banana,5_ + 0.5 s_banana,6_ + 0.5 s_banana,7_ + 0.5 s_banana,8_ + 0.5 s_banana,9_ + 0.5 s_banana,10_ + 0.3 s_apple,1_ + 0.3 s_apple,2_ + 0.3 s_apple,3_ + 0.3 s_apple,4_ + 0.3 s_apple,5_ + 0.3 s_apple,6_ + 0.3 s_apple,7_ + 0.3 s_apple,8_ + 0.3 s_apple,9_ + 0.3 s_apple,10_ + 0.4 s_orange,1_ + 0.4 s_orange,2_ + 0.4 s_orange,3_ + 0.4 s_orange,4_ + 0.4 s_orange,5_ + 0.4 s_orange,6_ + 0.4 s_orange,7_ + 0.4 s_orange,8_ + 0.4 s_orange,9_ + 0.4 s_orange,10_
subject to
c1_1: 1 s_banana,1_ + 1 s_apple,1_ + 1 s_orange,1_ <= 17
c2_1: 1 s_banana,2_ + 1 s_apple,2_ + 1 s_orange,2_ <= 17
c3_1: 1 s_banana,3_ + 1 s_apple,3_ + 1 s_orange,3_ <= 17
c4_1: 1 s_banana,4_ + 1 s_apple,4_ + 1 s_orange,4_ <= 17
c5_1: 1 s_banana,5_ + 1 s_apple,5_ + 1 s_orange,5_ <= 17
c6_1: 1 s_banana,6_ + 1 s_apple,6_ + 1 s_orange,6_ <= 17
c7_1: 1 s_banana,7_ + 1 s_apple,7_ + 1 s_orange,7_ <= 17
c8_1: 1 s_banana,8_ + 1 s_apple,8_ + 1 s_orange,8_ <= 17
c9_1: 1 s_banana,9_ + 1 s_apple,9_ + 1 s_orange,9_ <= 17
c10_1: 1 s_banana,10_ + 1 s_apple,10_ + 1 s_orange,10_ <= 17
c11_1: 1 x_m1,banana,1_ - 10 y_m1,banana,1_ <= 0
c12_1: 1 x_m1,apple,1_ - 10 y_m1,apple,1_ <= 0
c13_1: 1 x_m1,orange,1_ - 10 y_m1,orange,1_ <= 0
c14_1: 1 x_m1,banana,2_ - 10 y_m1,banana,2_ <= 0
c15_1: 1 x_m1,apple,2_ - 10 y_m1,apple,2_ <= 0
c16_1: 1 x_m1,orange,2_ - 10 y_m1,orange,2_ <= 0
c17_1: 1 x_m1,banana,3_ - 10 y_m1,banana,3_ <= 0
c18_1: 1 x_m1,apple,3_ - 10 y_m1,apple,3_ <= 0
c19_1: 1 x_m1,orange,3_ - 10 y_m1,orange,3_ <= 0
c20_1: 1 x_m1,banana,4_ - 10 y_m1,banana,4_ <= 0
c21_1: 1 x_m1,apple,4_ - 10 y_m1,apple,4_ <= 0
c22_1: 1 x_m1,orange,4_ - 10 y_m1,orange,4_ <= 0
c23_1: 1 x_m1,banana,5_ - 10 y_m1,banana,5_ <= 0
c24_1: 1 x_m1,apple,5_ - 10 y_m1,apple,5_ <= 0
c25_1: 1 x_m1,orange,5_ - 10 y_m1,orange,5_ <= 0
c26_1: 1 x_m1,banana,6_ - 10 y_m1,banana,6_ <= 0
c27_1: 1 x_m1,apple,6_ - 10 y_m1,apple,6_ <= 0
c28_1: 1 x_m1,orange,6_ - 10 y_m1,orange,6_ <= 0
c29_1: 1 x_m1,banana,7_ - 10 y_m1,banana,7_ <= 0
c30_1: 1 x_m1,apple,7_ - 10 y_m1,apple,7_ <= 0
c31_1: 1 x_m1,orange,7_ - 10 y_m1,orange,7_ <= 0
c32_1: 1 x_m1,banana,8_ - 10 y_m1,banana,8_ <= 0
c33_1: 1 x_m1,apple,8_ - 10 y_m1,apple,8_ <= 0
c34: 1 x_m1,orange,8_ - 10 y_m1,orange,8_ <= 0
c35: 1 x_m1,banana,9_ - 10 y_m1,banana,9_ <= 0
c36: 1 x_m1,apple,9_ - 10 y_m1,apple,9_ <= 0
c37: 1 x_m1,orange,9_ - 10 y_m1,orange,9_ <= 0
c38: 1 x_m1,banana,10_ - 10 y_m1,banana,10_ <= 0
c39: 1 x_m1,apple,10_ - 10 y_m1,apple,10_ <= 0
c40: 1 x_m1,orange,10_ - 10 y_m1,orange,10_ <= 0
c41: 1 x_m1,banana,1_ + 1 x_m1,apple,1_ + 1 x_m1,orange,1_ <= 20
c42: 1 x_m1,banana,2_ + 1 x_m1,apple,2_ + 1 x_m1,orange,2_ <= 20
c43: 1 x_m1,banana,3_ + 1 x_m1,apple,3_ + 1 x_m1,orange,3_ <= 20
c44: 1 x_m1,banana,4_ + 1 x_m1,apple,4_ + 1 x_m1,orange,4_ <= 20
c45: 1 x_m1,banana,5_ + 1 x_m1,apple,5_ + 1 x_m1,orange,5_ <= 20
c46: 1 x_m1,banana,6_ + 1 x_m1,apple,6_ + 1 x_m1,orange,6_ <= 20
c47: 1 x_m1,banana,7_ + 1 x_m1,apple,7_ + 1 x_m1,orange,7_ <= 20
c48: 1 x_m1,banana,8_ + 1 x_m1,apple,8_ + 1 x_m1,orange,8_ <= 20
c49: 1 x_m1,banana,9_ + 1 x_m1,apple,9_ + 1 x_m1,orange,9_ <= 20
c50: 1 x_m1,banana,10_ + 1 x_m1,apple,10_ + 1 x_m1,orange,10_ <= 20
c1: -1 x_m1,banana,1_ + 1 s_banana,1_ = 5
c2: -1 x_m1,apple,1_ + 1 s_apple,1_ = -1
c3: -1 x_m1,orange,1_ + 1 s_orange,1_ = 0
c4: -1 x_m1,banana,2_ - 1 s_banana,1_ + 1 s_banana,2_ = -5
c5: -1 x_m1,apple,2_ - 1 s_apple,1_ + 1 s_apple,2_ = -3
c6: -1 x_m1,orange,2_ - 1 s_orange,1_ + 1 s_orange,2_ = -4
c7: -1 x_m1,banana,3_ - 1 s_banana,2_ + 1 s_banana,3_ = -5
c8: -1 x_m1,apple,3_ - 1 s_apple,2_ + 1 s_apple,3_ = -3
c9: -1 x_m1,orange,3_ - 1 s_orange,2_ + 1 s_orange,3_ = -4
c10: -1 x_m1,banana,4_ - 1 s_banana,3_ + 1 s_banana,4_ = -5
c11: -1 x_m1,apple,4_ - 1 s_apple,3_ + 1 s_apple,4_ = -3
c12: -1 x_m1,orange,4_ - 1 s_orange,3_ + 1 s_orange,4_ = -4
c13: -1 x_m1,banana,5_ - 1 s_banana,4_ + 1 s_banana,5_ = -5
c14: -1 x_m1,apple,5_ - 1 s_apple,4_ + 1 s_apple,5_ = -3
c15: -1 x_m1,orange,5_ - 1 s_orange,4_ + 1 s_orange,5_ = -4
c16: -1 x_m1,banana,6_ - 1 s_banana,5_ + 1 s_banana,6_ = -5
c17: -1 x_m1,apple,6_ - 1 s_apple,5_ + 1 s_apple,6_ = -3
c18: -1 x_m1,orange,6_ - 1 s_orange,5_ + 1 s_orange,6_ = -4
c19: -1 x_m1,banana,7_ - 1 s_banana,6_ + 1 s_banana,7_ = -5
c20: -1 x_m1,apple,7_ - 1 s_apple,6_ + 1 s_apple,7_ = -3
c21: -1 x_m1,orange,7_ - 1 s_orange,6_ + 1 s_orange,7_ = -4
c22: -1 x_m1,banana,8_ - 1 s_banana,7_ + 1 s_banana,8_ = -5
c23: -1 x_m1,apple,8_ - 1 s_apple,7_ + 1 s_apple,8_ = -3
c24: -1 x_m1,orange,8_ - 1 s_orange,7_ + 1 s_orange,8_ = -4
c25: -1 x_m1,banana,9_ - 1 s_banana,8_ + 1 s_banana,9_ = -5
c26: -1 x_m1,apple,9_ - 1 s_apple,8_ + 1 s_apple,9_ = -3
c27: -1 x_m1,orange,9_ - 1 s_orange,8_ + 1 s_orange,9_ = -4
c28: -1 x_m1,banana,10_ - 1 s_banana,9_ + 1 s_banana,10_ = -5
c29: -1 x_m1,apple,10_ - 1 s_apple,9_ + 1 s_apple,10_ = -3
c30: -1 x_m1,orange,10_ - 1 s_orange,9_ + 1 s_orange,10_ = -4
c31: 1 s_banana,10_ = 10
c32: 1 s_apple,10_ = 2
c33: 1 s_orange,10_ = 4
Bounds
x_m1,banana,1_ >= 0
x_m1,apple,1_ >= 0
x_m1,orange,1_ >= 0
x_m1,banana,2_ >= 0
x_m1,apple,2_ >= 0
x_m1,orange,2_ >= 0
x_m1,banana,3_ >= 0
x_m1,apple,3_ >= 0
x_m1,orange,3_ >= 0
x_m1,banana,4_ >= 0
x_m1,apple,4_ >= 0
x_m1,orange,4_ >= 0
x_m1,banana,5_ >= 0
x_m1,apple,5_ >= 0
x_m1,orange,5_ >= 0
x_m1,banana,6_ >= 0
x_m1,apple,6_ >= 0
x_m1,orange,6_ >= 0
x_m1,banana,7_ >= 0
x_m1,apple,7_ >= 0
x_m1,orange,7_ >= 0
x_m1,banana,8_ >= 0
x_m1,apple,8_ >= 0
x_m1,orange,8_ >= 0
x_m1,banana,9_ >= 0
x_m1,apple,9_ >= 0
x_m1,orange,9_ >= 0
x_m1,banana,10_ >= 0
x_m1,apple,10_ >= 0
x_m1,orange,10_ >= 0
s_banana,1_ >= 0
s_apple,1_ >= 0
s_orange,1_ >= 0
s_banana,2_ >= 0
s_apple,2_ >= 0
s_orange,2_ >= 0
s_banana,3_ >= 0
s_apple,3_ >= 0
s_orange,3_ >= 0
s_banana,4_ >= 0
s_apple,4_ >= 0
s_orange,4_ >= 0
s_banana,5_ >= 0
s_apple,5_ >= 0
s_orange,5_ >= 0
s_banana,6_ >= 0
s_apple,6_ >= 0
s_orange,6_ >= 0
s_banana,7_ >= 0
s_apple,7_ >= 0
s_orange,7_ >= 0
s_banana,8_ >= 0
s_apple,8_ >= 0
s_orange,8_ >= 0
s_banana,9_ >= 0
s_apple,9_ >= 0
s_orange,9_ >= 0
s_banana,10_ >= 0
s_apple,10_ >= 0
s_orange,10_ >= 0
Binary
y_m1,banana,1_
y_m1,apple,1_
y_m1,orange,1_
y_m1,banana,2_
y_m1,apple,2_
y_m1,orange,2_
y_m1,banana,3_
y_m1,apple,3_
y_m1,orange,3_
y_m1,banana,4_
y_m1,apple,4_
y_m1,orange,4_
y_m1,banana,5_
y_m1,apple,5_
y_m1,orange,5_
y_m1,banana,6_
y_m1,apple,6_
y_m1,orange,6_
y_m1,banana,7_
y_m1,apple,7_
y_m1,orange,7_
y_m1,banana,8_
y_m1,apple,8_
y_m1,orange,8_
y_m1,banana,9_
y_m1,apple,9_
y_m1,orange,9_
y_m1,banana,10_
y_m1,apple,10_
y_m1,orange,10_
End
