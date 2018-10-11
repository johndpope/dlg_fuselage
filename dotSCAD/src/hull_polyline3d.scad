/**
* hull_polyline3d.scad
*
* Creates a 3D polyline from a list of `[x, y, z]` coordinates. 
* As the name says, it uses the built-in hull operation for each pair of points (created by the sphere module). 
* It's slow. However, it can be used to create metallic effects for a small $fn, large $fa or $fs.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/hull_polyline3d.html
*
**/

module hull_polyline3d(points, thickness) {
    half_thickness = thickness / 2;
    leng = len(points);
    
    module hull_line3d(index) {
        point1 = points[index - 1];
        point2 = points[index];

        hull() {
            translate(point1) 
                sphere(half_thickness);
            translate(point2) 
                sphere(half_thickness);
        }

        // hook for testing
        test_line_segment(index, point1, point2, half_thickness);        
    }

    module polyline3d_inner(index) {
        if(index < leng) {
            hull_line3d(index);
            polyline3d_inner(index + 1);
        }
    }

    polyline3d_inner(1);
}

// override it to test
module test_line_segment(index, point1, point2, radius) {

}