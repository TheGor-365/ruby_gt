// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers"
import "./controllers/index"
import "./features"

import * as bootstrap from "bootstrap"

import "trix"
import "@rails/actiontext"

require("jquery")
require("@nathanvda/cocoon")
