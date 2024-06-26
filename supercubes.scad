//Supercubes
//Cubes with alignable origins and other new geometry.

//Version 0.14
//Author: Ross Barros-Smith
//License: LGPL v3


//== Version history ==
//0.14 - June 27, 2024: Added spherically blunted ogives. Will merge modules soon.
//0.131 - June 22, 2024: Combined supersquare variants into one module.
//0.13 - June 19, 2024: Combined supercube variants into one module.
//0.12- June 9, 2024: Added supercube_fr() module.
// 0.11 - June 1, 2024: Moved project to GitHub. No change in version number.
//0.11 - March 20, 2024: Added 2d and 3D ovives.
//0.1 - January 1, 2024: Rewrite of Cubetools. Library currently includes modules for cubes, chamfered cubes, radiused cubes, 2d squres, 2d ellipses. Chamfer and radius variations will be merged into their core modules in an upcoming version. Keeping pieces likely to change separate for now.


//Supercubes modules
module supercube(size=[10,10,10],center=[0,0,0],r=0,chamfer=0){

	//Radiused chamfered cube
	*if (r != 0 || chamfer != 0) {
		
		//size=([size=[0]-r*2,size=[1]-r*2,size=[2]-r*2,]);
		
		//translate([-r,-r,-r])
		
			translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]])
			minkowski(){
			hull(){
				translate([chamfer,chamfer,0])
				cube([size[0]-chamfer*2,size[1]-chamfer*2,size[2]]);
				
				translate([chamfer,0,chamfer])
				cube([size[0]-chamfer*2,size[1],size[2]-chamfer*2]);
				
				translate([0,chamfer,chamfer])
				cube([size[0],size[1]-chamfer*2,size[2]-chamfer*2]);
			}
		sphere(r=r);
		}
	}
	
	//Radiused Cube
	if (r != 0) {
		translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]])
		hull(){
			translate([r,r,0])
			cube([size[0]-r*2,size[1]-r*2,size[2]]);
			
			translate([r,0,r])
			cube([size[0]-r*2,size[1],size[2]-r*2]);
			
			translate([0,r,r])
			cube([size[0],size[1]-r*2,size[2]-r*2]);
			
			//Bottom left front corner
			translate([r,r,r]) sphere(r=r);
			
			//Bottom right front corner
			translate([size[0]-r,r,r]) sphere(r=r);
			
			//Bottom left back corner
			translate([r,size[1]-r,r]) sphere(r=r);
			
			//Bottom right back corner
			translate([size[0]-r,size[1]-r,r]) sphere(r=r);
			
			//Top left front corner
			translate([r,r,size[2]-r]) sphere(r=r);
			
			//Top right front corner
			translate([size[0]-r,r,size[2]-r]) sphere(r=r);
			
			//Top left back corner
			translate([r,size[1]-r,size[2]-r]) sphere(r=r);
			
			//Top right back corner
			translate([size[0]-r,size[1]-r,size[2]-r]) sphere(r=r);
			}
	}

	//Chamfered Cube
	else if (chamfer != 0 ) {
		translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]])
		hull(){
			translate([chamfer,chamfer,0])
			cube([size[0]-chamfer*2,size[1]-chamfer*2,size[2]]);
			
			translate([chamfer,0,chamfer])
			cube([size[0]-chamfer*2,size[1],size[2]-chamfer*2]);
			
			translate([0,chamfer,chamfer])
			cube([size[0],size[1]-chamfer*2,size[2]-chamfer*2]);
		}
	}


	// Regular Cube
	else translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]]) cube(size);
}
	
	


module supercube_fr(size=[10,10,10],center=[0,0,0],r=1){
	translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]])
	hull(){
		//translate([r,r,0]) cube([size[0]-r*2,size[1]-r*2,size[2]]);
		
		translate([r,0,0]) cube([size[0]-r*2,size[1],size[2]]);
		
		translate([0,r,0]) cube([size[0],size[1]-r*2,size[2]]);
		
		//Bottom left front corner
		translate([r,r,0]) cylinder(r=r,h=size[2]);
		
		//Bottom right front corner
		translate([size[0]-r,r,0]) cylinder(r=r,h=size[2]);
		
		//Bottom left back corner
		translate([r,size[1]-r,0]) cylinder(r=r,h=size[2]);
		
		//Bottom right back corner
		translate([size[0]-r,size[1]-r,0]) cylinder(r=r,h=size[2]);
		}
}



module supersquare(size=[10,10],center=[0,0],r=0,chamfer=0){
	//Radiused square
	if (r != 0) {
		translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
		hull(){
			translate([r,r,0]) square([size[0]-r*2,size[1]-r*2]);
		
			//Bottom left front corner
			translate([r,r,r]) circle(r=r);
			
			//Bottom right front corner
			translate([size[0]-r,r,r]) circle(r=r);
			
			//Bottom left back corner
			translate([r,size[1]-r,r]) circle(r=r);
			
			//Bottom right back corner
			translate([size[0]-r,size[1]-r,r]) circle(r=r);
		}		
	}	

	//Chamfered Square
	else if (chamfer != 0 ) {
		translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
		hull(){
			translate([chamfer,0,0]) square([size[0]-chamfer*2,size[1]]);
			translate([0,chamfer,0]) square([size[0],size[1]-chamfer*2]);
		}
	}

	//Regular square
	else
		translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
				square([size[0],size[1]]);
}


//2D Ellipse
module ellipse(size=[10,5]){
	scale([1,size[1]/size[0]]) circle(size[0]/2);
}

//Elliptical Cylinder
module ellipse_cylinder(size=[10,5,10]){
	linear_extrude(height=size[2]) scale([1,size[1]/size[0]]) circle(size[0]/2);
}
	
	
//2D Tangent Ogive
module ogive(r=20,shank=10,verbose=false){
//cap=sqrt(r^2-(r-(shank/2))^2); //y^2=r^2-x^2 ... x=-r-(shank/2)

	intersection(){
		translate([r-shank/2,0,0]) circle(r=r);
		translate([-r+shank/2,0,0]) circle(r=r);
		translate([-shank/2,0,0]) square([shank,r]);
	}

//Information Output
	if (verbose==true) {
		echo("Ogive Y: ", sqrt(r^2-(r-(shank/2))^2));
		echo("Ogive X: ", shank);
	}
}

//2D Tangent Circularly Blunted Ogive
module ogive_br(r=20,shank=10,br=3,verbose=false){
	peak_h=sqrt(r^2-(r-(shank/2))^2);
	cap_h=sqrt( (r-br)^2-(r-(shank/2))^2);

	hull(){
		translate([0,cap_h,0]) circle(r=br);

		difference(){
			intersection(){
				translate([r-shank/2,0,0]) circle(r=r);
				translate([-r+shank/2,0,0]) circle(r=r);
				translate([-shank/2,0,0]) square([shank,r]);
			}
		translate([-shank/2,cap_h,0]) square([shank,r]);
		}
	}
	//Information Output
	if (verbose==true) {
		echo("Ogive Y: ", sqrt(r^2-(r-(shank/2))^2)+br/2);
		echo("Ogive X: ", shank);
	}
}

//3D Tangent Ogive
module ogive_3d(r=20,shank=10,verbose=false){
	rotate_extrude(angle=360,convexity=2)
	intersection(){
		translate([-r+shank/2,0,0]) circle(r=r);
		square([shank,r]);
	}

	//Information Output
	if (verbose==true) {
		echo("Ogive Height: ", sqrt(r^2-(r-(shank/2))^2));
		echo("Ogive Diameter: ", shank);
		echo("Ogive Radius: ", shank/2);
	}
}

//3D Tangent Spherically Blunted Ogive
module ogive_br_3d(r=20,shank=10,br=3,verbose=false){
	peak_h=sqrt(r^2-(r-(shank/2))^2);
	cap_h=sqrt( (r-br)^2-(r-(shank/2))^2);

	rotate_extrude(angle=360)
	hull(){
		intersection(){
		translate([0,cap_h,0]) circle(r=br);
		translate([0,0,0]) square([shank,r]);
		}

		difference(){
			intersection(){
				translate([-r+shank/2,0,0]) circle(r=r);
				translate([0,0,0]) square([shank,r]);
			}
		translate([-shank/2,cap_h,0]) square([shank,r]);
		}
	}
	//Information Output
	if (verbose==true) {
		echo("Ogive Height: ", sqrt(r^2-(r-(shank/2))^2)+br/2);
		echo("Ogive Diameter: ", shank);
		echo("Ogive Radius: ", shank/2);
	}
}
