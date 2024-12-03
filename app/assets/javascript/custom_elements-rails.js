export function eagerDefineCustomElementsFrom(namespace, options = {}) {
  const importmap = document.querySelector('script[type="importmap"]')
  const { imports } = JSON.parse(importmap.textContent)
  const regex = new RegExp(`${namespace}\/(.*?)_element`)
  Object.entries(imports)
    .filter(([name, _]) => name.match(regex) )
    .map(([name, importPath]) => [name.match(regex)[1].replace('_', '-'), importPath])
    .forEach(([name, importPath]) => {
      import(importPath)
        .then((module) => {
          customElements.define(`${options.prefix}-${name}`, module.default)
        })
        .catch((error) => {
          console.error(`custom_elements-rails: Could not import custom element <${options.prefix}-${name}>`)
          throw error
        })
    })
}
