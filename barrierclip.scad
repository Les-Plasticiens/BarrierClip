include <BOSL2/std.scad>
// poteau 26.95., largeur face = 22.98
cuboid([3, 30.45, 64.10], rounding=3.5, edges=[TOP+FRONT, BOTTOM+FRONT]) { // front face
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
