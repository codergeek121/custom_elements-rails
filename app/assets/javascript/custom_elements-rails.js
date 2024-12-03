export function eagerDefineCustomElementsFrom(namespace, options = {}) {
  const pathToElementName = (path) => {
    const parts = path.split('/').map(p => p.replace(/_/g, '-'));
    return `${options.prefix}-${parts.slice(0, -1).join('--')}${parts.length > 1 ? '--' : ''}${parts.at(-1)}`;
  }
  const importmap = document.querySelector('script[type="importmap"]')
  const { imports } = JSON.parse(importmap.textContent)
  const regex = new RegExp(`${namespace}/(.*?)[-_]element`)
  Object.entries(imports)
    .filter(([name, _]) => name.match(regex) )
    .map(([name, importPath]) => { return [pathToElementName(name.match(regex)[1]), importPath] })
    .forEach(([name, importPath]) => {
      import(importPath)
        .then((module) => {
          customElements.define(name, module.default)
        })
        .catch((error) => {
          console.error(`custom_elements-rails: Could not import custom element <${options.prefix}-${name}>`)
          throw error
        })
    })
}
