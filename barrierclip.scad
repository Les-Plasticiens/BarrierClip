include <BOSL2/std.scad>
$fn = 64;
// poteau 26.95., largeur face = 22.98
// trou de visse:  7.59 du top, 6.31 du bord avant, diam du trou 4 mm.
diff() {
    cuboid([1 /* 3 */, 30.45, 64.10], rounding=3.5, edges=[TOP+FRONT, BOTTOM+FRONT]) {
       tag("remove")position(TOP+FRONT) yrot(90) back(8.21)  right(9.05) down(3) cyl(h=6, r=2, anchor=BOTTOM);
       tag("remove") position(BOTTOM+FRONT) yrot(-90) back(8.21)  right(9.05) down(3) cyl(h=6, r=2, anchor=BOTTOM);
    }
}
/*
{ // front face
    position(LEFT) 
        diff() {  // holder
            cuboid([29.95, 30.45, 64.10],rounding=3.5, edges=[TOP+FRONT, BOTTOM+FRONT],anchor=RIGHT) {
                right(3.5) back(3) tag("remove") cuboid([30.95, 30.45, 64.10]);
                
                tag("keep")align(BACK+LEFT) {
                    right(3.5) cuboid([3.5, 0.5, 64.10], anchor=RIGHT);
                }
            }
           
        }
    align(BACK) {
        left(0.25)  cuboid([3.5, 0.5, 64.10], anchor=FRONT);
    }
}
*/;
