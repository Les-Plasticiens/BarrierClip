include <BOSL2/std.scad>
$fn = 64;
// poteau 26.95., largeur face = 22.98
// trou de visse:  7.59 du top, 6.31 du bord avant, diam du trou 4 mm.

module face_plate( anchor=CENTER, spin=0, orient=UP ) {
    attachable(anchor, spin, orient, size=[5,30.45,37.62]) {
        diff() {
            cuboid([5, 30.45, 37.62], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) {

                tag("keep") position(LEFT) 
                    diff("nope", "yes") {  // holder
                        cuboid([29.95, 30.45, 37.62],rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT],anchor=RIGHT) {
                            right(3.5) back(3.5) tag("nope") cuboid([30.95, 30.45, 37.62]);
                            
                            tag("yes")align(BACK+LEFT) {
                                right(3.5) cuboid([3.5, 0.5, 37.62], anchor=RIGHT);
                            }
                        }
                    
                    }
                tag("keep") align(BACK) {
                    left(0.25)  cuboid([5.5, 0.5, 37.62], anchor=FRONT);
                }
            }
        }
        children();
    }
}

face_plate()  
    align(FRONT+RIGHT) {
        back(3.5) cuboid([35.97, 3.5, 37.62], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) align(RIGHT) {
              xrot(90) yrot(90) left(1.75) up(1.75) prismoid(size2=[28.4, 37.62], h=3.5 ,  xang=[90, 100], yang=[90, 90]);// align(BOTTOM) {
    //            color("RED")  xrot(90) zrot(-10) up(37.62/2) back(1.75 ) left((18.4 - 3.5)/2) prismoid(size2=[12.29, 3.5], h=37.62, xang=[90, 90], yang=[90, 90]) ;
   //             color("RED")  zrot(10)  left(7.895) fwd(3.5)cuboid([12.29, 3.5, 37.62],anchor=RIGHT) ;

            }; 
            
        }
   // }

//left(100) prismoid(size2=[100,75], h=30, xang=[80, 100], yang=[90, 90]);