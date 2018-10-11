/**
* sub_str.scad
*
* Returns a new string that is a substring of the given string.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-sub_str.html
*
**/ 

function sub_str(t, begin, end, result = "") =
    end == undef ? sub_str(t, begin, len(t)) : (
        begin == end ? result : sub_str(t, begin + 1, end, str(result, t[begin]))
    );
    