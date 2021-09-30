// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import { registerControllersFrom } from "@hotwired/stimulus-importmap-autoloader"
registerControllersFrom("controllers", application)

// register stimulus-components/stimulus-password-visibility
import PasswordVisibility from "stimulus-password-visibility"
application.register("password-visibility", PasswordVisibility)
