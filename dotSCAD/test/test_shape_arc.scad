include <unittest.scad>;
include <shape_arc.scad>;

module test_shape_arc() {
    echo("==== test_shape_arc ====");

    expected = [[0, -12.4315], [1.3066, -12.4315], [3.8627, -11.8882], [6.25, -10.8253], [8.3641, -9.2893], [10.1127, -7.3473], [11.4193, -5.0842], [12.2268, -2.5989], [12.5, 0], [12.2268, 2.5989], [11.4193, 5.0842], [10.1127, 7.3473], [8.3641, 9.2893], [6.25, 10.8253], [3.8627, 11.8882], [1.3066, 12.4315], [0, 12.4315], [0, 7.4589], [0.784, 7.4589], [2.3176, 7.1329], [3.75, 6.4952], [5.0185, 5.5736], [6.0676, 4.4084], [6.8516, 3.0505], [7.3361, 1.5593], [7.5, 0], [7.3361, -1.5593], [6.8516, -3.0505], [6.0676, -4.4084], [5.0185, -5.5736], [3.75, -6.4952], [2.3176, -7.1329], [0.784, -7.4589], [0, -7.4589]];

    actual = shape_arc(radius = 10, angle = [-90, 90], width = 5);

    assertEqualPoints(expected, actual);
}

test_shape_arc();