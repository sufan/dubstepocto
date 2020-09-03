## Table of Contents
[Developement Assets](https://github.com/sufan/dubstepocto#developement-assets)     
[Passing Geometry as Environment Key](https://github.com/sufan/dubstepocto#passing-geometry-as-environment-key)     
[Use .constant to Preview Binding](https://github.com/sufan/dubstepocto#use-constant-to-preview-binding)     

## Chapter
### [Developement Assets](#developement-assets)
```swift
// Adding assets available for development but won't be included in production.
// Inside Project file for the Target platform:
DEVELOPMENT_ASSET_PATHS = "path";
```

### [Passing Geometry as Environment Key](#passing-geometry-as-environment-key)
```swift
struct GeometryKey: EnvironmentKey {
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var geometry: CGSize {
        get { self[GeometryKey.self] }
        set { self[GeometryKey.self] = newValue }
    }
}

struct Preview: View {
    var body: some View {
        GeometryReader(content: { geometry in
            Image(systemName: "bonjour")
                .environment(\.geometry, geometry.size)
        })
    }
}
```

### [Use .constant to Preview Binding](#use-constant-to-preview-binding)
```swift
struct Preview: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle(isOn ? "On" : "Off", isOn: $isOn)
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(isOn: .constant(true))
    }
}

```
