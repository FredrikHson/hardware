width = 330.0;
height = 75.0;
depth = 240.0;
frame_thickness = 10.0;
frame_width = 20.0;
pillar_thickness = frame_width / 2;
cellsize = 9.0;
cellthickness = 1.0;
table_thickness = 5.0;
table_width = width - 2 * frame_width;
table_depth = depth - 2 * frame_width;

module frame()
{
    cube(size = [width, frame_width, frame_thickness]);
    translate([0, depth - frame_width, 0])
    {
        cube(size = [width, frame_width, frame_thickness]);
    }
    translate([0, frame_width, 0])
    {
        cube(size = [frame_width, depth - 2 * frame_width, frame_thickness]);
    }
    translate([width - frame_width, frame_width, 0])
    {
        cube(size = [frame_width, depth - 2 * frame_width, frame_thickness]);
    }
}


module table()
{
    difference()
    {
        cube(size = [table_width, table_depth, table_thickness]);

        depthoffset = (table_depth - floor(table_depth / cellsize / 1.733) * cellsize * 1.733) / 2;

        translate([cellsize / 2 + (table_width - (floor((table_width / cellsize)))*cellsize) / 2 ,
                   cellsize / 2 + depthoffset,
                   -table_thickness / 2])
        {
            for(i = [0:floor(table_width / cellsize) - 1])
            {
                for(j = [0:floor(table_depth / cellsize / 1.733) - 1])
                {
                    translate([i * cellsize, j * cellsize * 1.733, 0])
                    {
                        rotate([0, 0, 90])
                        cylinder(d = cellsize / 0.866 - cellthickness , h = table_thickness * 2, $fn = 6);
                    }
                }
            }
        }
        translate([cellsize + (table_width - (floor((table_width / cellsize)))*cellsize) / 2 ,
                   cellsize + cellsize / 2.73 + depthoffset,
                   -table_thickness / 2])
        {
            for(i = [0:floor(table_width / cellsize) - 2])
            {
                for(j = [0:floor(table_depth / cellsize / 1.733) - 1])
                {
                    translate([i * cellsize, j * cellsize * 1.733, 0])
                    {
                        rotate([0, 0, 90])
                        cylinder(d = cellsize / 0.866 - cellthickness , h = table_thickness * 2, $fn = 6);
                    }
                }
            }
        }
    }
}
translate([frame_width / 2,  frame_width / 2, 0])
{
    cylinder(d = pillar_thickness, h = height);
}
translate([frame_width / 2,  depth - frame_width / 2, 0])
{
    cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2,  frame_width / 2, 0])
{
    cylinder(d = pillar_thickness, h = height);
}
translate([width - frame_width / 2,  depth - frame_width / 2, 0])
{
    cylinder(d = pillar_thickness, h = height);
}
frame();
translate([0, 0, height - frame_thickness])
{
    frame();
}
translate([frame_width, frame_width, frame_thickness * 2])
{
    table();
}
