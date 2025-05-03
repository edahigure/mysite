import { application } from "./application"

// Automatically load all controllers in the controllers directory
const controllers = import.meta.globEager("./**/*_controller.js")
Object.entries(controllers).forEach(([filename, controllerModule]) => {
  const controllerName = filename
    .replace("./", "")
    .replace("_controller.js", "")
    .replace(/\//g, "--")
  
  application.register(controllerName, controllerModule.default)
})