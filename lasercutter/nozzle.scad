exithole_radius = 2;
outer_radius = 15;
total_height = 50;
lens_radius = 10;
focal_distance = 50.8;
lensoffset = 5;
lensthickness = 2;
translate([0, 0, -focal_distance - 1])
{
    color("red")
    {
        cylinder(h = focal_distance, r = 0, r2 = 2.5, $fn = 32);
        /*cylinder(h = focal_distance, r = 0, r2 = lens_radius - 2, $fn = 32);*/
    }
}
translate([0, 0, -total_height + lensoffset])
{
    difference()
    {
        rotate_extrude($fn = 128)
        {
            polygon(points = [
                                 [exithole_radius, 2],
                                 [exithole_radius, 0],
                                 [exithole_radius + 3, 0],
                                 [exithole_radius + 6, 4],
                                 [outer_radius, total_height - 20],
                                 [outer_radius, total_height - 0.5],
                                 [outer_radius - 0.5, total_height],
                                 [21.5 / 2, total_height],
                                 [20.5 / 2, total_height - 0.5],
                                 [20.5 / 2, total_height - lensoffset ],
                                 [lens_radius + 0.4, total_height - lensoffset],
                                 [lens_radius + 0.2, total_height - lensoffset - 0.2],
                                 [lens_radius + 0.2, total_height  - lensoffset - lensthickness],
                                 [lens_radius - 0.8, total_height - lensoffset - lensthickness],
                                 [lens_radius - 1, total_height - lensoffset - lensthickness - 0.2],
                                 [lens_radius - 1, 17],
                                 [lens_radius / 2, 15],
                                 [lens_radius / 2, 7],
                                 [lens_radius / 2, 3],
                             ]);
        }
        // cut it in half to see whats going on
        /*translate([0, -20, -1])*/
        /*{*/
        /*cube([40, 40, 95]);*/
        /*}*/

        for(angle = [0:360 / 8:360])
        {
            rotate([0, 0, angle])
            {
                translate([0, outer_radius + 1, 0])
                {

                    union()
                    {
                        cylinder(r = 4, h = total_height - 12, $fn = 32);
                        translate([0, 0, total_height-12])
                        {
                            sphere(r = 4,$fn=32);
                        }
                    }
                }
            }
        }
    }
}
