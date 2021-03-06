/**
* hull_polyline2d.scad
*
* Creates a 2D polyline from a list of `[x, y]` coordinates. 
* As the name says, it uses the built-in hull operation for each pair of points (created by the circle module). 
* It's slow. However, it can be used to create metallic effects for a small $fn, large $fa or $fs.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/hull_polyline2d.html
*
**/

module hull_polyline2d(points, width) {
    half_width = width / 2;
    leng = len(points);
    
    module hull_line2d(index) {
        point1 = points[index - 1];
        point2 = points[index];

        hull() {
            translate(point1) 
                circle(half_width);
            translate(point2) 
                circle(half_width);
        }

        // hook for testing
        test_line_segment(index, point1, point2, half_width);
    }

    module polyline2d_inner(index) {
        if(index < leng) {
            hull_line2d(index);
            polyline2d_inner(index + 1);
        }
    }

    polyline2d_inner(1);
}

// override it to test
module test_line_segment(index, point1, point2, radius) {

}