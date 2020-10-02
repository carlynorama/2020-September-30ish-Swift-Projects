//
//  WorksData.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import SwiftUI


let worksArray = [
    Work(title: "Blanco y Verde",
         size: Size(w:153.7, h:173),
         representation: AnyView(BlancoYVerde()),
         year: "1959",
         medium: "Acrylic on canvas",
         collection: "Whitney Museum of American Art. Purchase, with funds from the Painting and Sculpture Committee.",
        referenceURL: "https://whitney.org/Exhibitions/CarmenHerrera#exhibition-artworks"
    ),
    Work(title: "Rondo (Blue and Yellow)",
         size: Size(w:100, h:100),
         representation: AnyView(Rondo()),
         year: "1965",
         medium: "Acrylic on canvas",
         collection: "Hirshhorn Museum and Sculpture Garden, Smithsonian Institution, Washington, DC, Joseph H. Hirshhorn Bequest Fund, 2007",
        referenceURL: "https://www.si.edu/object/rondo-blue-and-yellow:hmsg_07.94"
    ),
    Work(title: "Unknown",
         size: Size(w:200, h:300),
         representation: AnyView(Radial()),
         year: "1980s?",
         medium: nil,
         collection: nil,
         referenceURL: "https://mobile.twitter.com/womensart1/status/1305507366255955969"
    ),
    Work(title: "Untitled",
         size: Size(w:152.4, h:63.5),
         representation: AnyView(Untitled1952()),
         year: "1952",
         medium: "Acrylic on canvas",
         collection: "MOMA, Gift of Agnes Gund and Tony Bechara",
         referenceURL: "https://www.moma.org/collection/works/101471"
    ),
    Work(title: "untitled",
         size: Size(w:69.9, h:49.5),
         representation: AnyView(untitled2017()),
         year: "2017",
         medium: "Acrylic on paper",
         collection: "MOMA, Gift of Agnes Gund and Tony Bechara",
         referenceURL: "https://www.artsy.net/artwork/carmen-herrera-untitled-20"
    )
]



