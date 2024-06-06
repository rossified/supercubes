//Supercubes
//Cubes with alignable origins and other new geometry.

//Version 0.11
//Author: Ross Barros-Smith
//License: LGPL v3


//== Version history == 
// 0.11 - June 1, 2024: Moved project to GitHub. No change in version number.
// 0.11 - March 20, 2024: Added 2d and 3D ovives.
// 0.1 - January 1, 2024: Rewrite of Cubetools. Library currently includes modules for cubes, chamfered cubes, radiused cubes, 2d squres, 2d ellipses. Chamfer and radius variations will be merged into their core modules in an upcoming version. Keeping pieces likely to change separate for now.


//Supercubes modules
module supercube(size=[10,10,10],center=[0,0,0]){
	translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1],size[2]*-0.5*center[2]]) cube(size);
	}
	
	
module supercube_chamfer(size=[10,10,10],center=[0,0,0],chamfer=1){
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

module supercube_r(size=[10,10,10],center=[0,0,0],r=1){
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
	
module supersquare(size=[10,10],center=[0,0]){
	translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
		cube([size[0]-chamfer*2,size[1]-chamfer*2,size[2]]);
}

module supersquare_r(size=[10,10],center=[0,0],r=2.5){
	translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
	hull(){

		translate([r,r,0]) square([size[0]-r*2,[size[1]-r*2]]);
	
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

	
module supersquare_chamfer(size=[10,10],center=[0,0],chamfer=1){
	translate([size[0]*-0.5*center[0],size[1]*-0.5*center[1]])
	hull(){
		translate([chamfer,0,0]) square([size[0]-chamfer*2,size[1]]);
		translate([0,chamfer,0]) square([size[0],size[1]-chamfer*2]);
		}
}


module ellipse(size=[10,5]){
	scale([1,size[1]/size[0]]) circle(size[0]/2);
}
	
module ellipse_cylinder(size=[10,5,10]){
	linear_extrude(height=size[2]) scale([1,size[1]/size[0]]) circle(size[0]/2);
}
	
	
module ogive(r=20,shank=10){
	intersection(){
		translate([r-shank/2,0,0]) circle(r=r);
		translate([-r+shank/2,0,0]) circle(r=r);
		translate([-shank/2,0,0]) square([shank,r]);
	}
}

module ogive_3d(r=20,shank=10){
	rotate_extrude(angle=360,convexity=2)
	intersection(){
		translate([-r+shank/2,0,0]) circle(r=r);
		square([shank,r]);
	}
}

