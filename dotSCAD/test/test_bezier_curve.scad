module test_bezier_curve() {
    echo("==== test_bezier_curve ====");

    include <unittest.scad>;
    include <bezier_curve.scad>;

    t_step = 0.05;
    width = 2;

    p0 = [0, 0, 0];
    p1 = [40, 60, 35];
    p2 = [-50, 90, 0];
    p3 = [0, 200, -35];

    expected = [[0, 0, 0], [5.0588, 8.7888, 4.7338], [8.37, 17.21, 8.47], [10.1363, 25.3463, 11.2613], [10.56, 33.28, 13.16], [9.8438, 41.0938, 14.2188], [8.19, 48.87, 14.49], [5.8013, 56.6913, 14.0263], [2.88, 64.64, 12.88], [-0.3712, 72.7987, 11.1038], [-3.75, 81.25, 8.75], [-7.0537, 90.0762, 5.8713], [-10.08, 99.36, 2.52], [-12.6263, 109.184, -1.2513], [-14.49, 119.63, -5.39], [-15.4688, 130.781, -9.8438], [-15.36, 142.72, -14.56], [-13.9612, 155.529, -19.4863], [-11.07, 169.29, -24.57], [-6.4837, 184.086, -29.7588], [0, 200, -35]];
    
    actual = bezier_curve(t_step, 
        [p0, p1, p2, p3]
    );

   // round_echo_pts(actual, float_digits = 3);
    
    assertEqualPoints(expected, actual, float_digits = 3);

}

test_bezier_curve();