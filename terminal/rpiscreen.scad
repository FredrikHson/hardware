
module roundedcorner(radius)
{
    difference()
    {
        translate([-0.1, -0.1, 0])
        {
            square([radius + 0.1, radius + 0.1]);
        }
        translate([radius, radius, 0])
        {
            circle(radius, $fn = 32);
        }
    }
}

module roundedsquare(width, height)
{
    difference()
    {
        square([width, height]);
        roundedcorner(6);
        translate([width, 0])
        {
            mirror([1, 0, 0])
            {
                roundedcorner(6);
            }
        }
        translate([0, height, 0])
        {
            mirror([0, 1, 0])
            {
                roundedcorner(6);
                translate([width, 0])
                {
                    mirror([1, 0, 0])
                    {
                        roundedcorner(6);
                    }
                }
            }
        }
    }
}
module screwpeg()
{

    difference()
    {
        linear_extrude(height = 2.5)
        {
            circle(d = 8, $fn = 32);
        }
        translate([0, 0, -0.05])
        {
            linear_extrude(height = 2.6)
            {
                circle(d = 3, $fn = 32);
            }
        }
    }
}
difference()
{
    union()
    {
        linear_extrude(height = 0.82)
        {
            roundedsquare(192.96, 110.76);
        }
        translate([11.89, 6.63, 0.82])
        {
            linear_extrude(height = 5.96 - 0.82)
            {
                square([166.2, 100.6]);
            }
        }
        translate([11.89 + 20, 21.58, 5.96])
        {
            screwpeg();
            translate([126.2, 0, 0])
            {
                screwpeg();
            }
            translate([0, 65.65, 0])
            {
                screwpeg();
                translate([126.2, 0, 0])
                {
                    screwpeg();
                }
            }
        }
        translate([11.89 + 48.45, 6.63 + 20.8, 5.96])
        {
            screwpeg();
            translate([58.0, 0, 0])
            {
                screwpeg();
            }
            translate([0, 49.0, 0])
            {
                screwpeg();
                translate([58.0, 0, 0])
                {
                    screwpeg();
                }
            }
            translate([-2, -2, 2.5])
            {
                linear_extrude(height = 10)
                {
                    square([62, 53]);
                }
            }
        }
    }
    translate([19.04, 11.01, -0.1])
    {
        linear_extrude(height = 0.2)
        {
            square([154.88, 86.72]);
        }
    }
}
