Point(1) = {0, 0, 0, 0.05};
Point(2) = {0.5, 0, 0, 0.05};
Point(3) = {1, 0, 0, 0.050};
Point(4) = {1, 1, 0, 0.050};
Point(5) = {0, 1, 0, 0.050};
Point(6) = {0.5, 1, 0, 0.050};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 6};
Line(5) = {6, 5};
Line(6) = {5, 1};
Line(7) = {2, 6};
Line Loop(8) = {7, 5, 6, 1};
Plane Surface(9) = {8};
Line Loop(10) = {7, -4, -3, -2};
Plane Surface(11) = {10};

Physical Line(2) = {6};
Physical Line(3) = {3};
Physical Line(1) = {5, 4, 1, 2};

Physical Surface(15) = {11, 9};
