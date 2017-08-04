// Milk Label

// Label
label="refill if empty!";
label_side="cold milk";
label_size=8;
hight=20;

// Milk Container
milk_x=90;
milk_z=59;

// Offset
off_x=1;
off_z=1;
border=4;

// Build
Milk(label, label_side, label_size, milk_x+off_x, hight, milk_z+off_z, border);

module Milk(label, label_side, label_size, x, y, z, border) {
    // Set label size
    size=milk_x;

    // Ring
    translate([0, y/2, 0]) {
        difference() {
            cube([x+border, border, z+border], center=true);
            cube([x-border, border*2, z-border], center=true);
        }
    }

    // Block
    difference() {
        cube([x+border, y+border, z+border], center=true);
        cube([x, y+border+1, z], center=true);
        Label(label, size, label_size);

        rotate([0,180,0]) {
            Label(label, size, label_size);
        }
       
        rotate([0,90,0]) {
            Label(label_side, size, label_size);
        }
        
        rotate([0,270,0]) {
            Label(label_side, size, label_size);
        }
    }
}

module Label(label, size, label_size) {
    linear_extrude(height=size, convexity=4)
        text(label,
            size=label_size,
            font="Currier New",
            halign="center",
            valign="center");
}

echo(version=version());