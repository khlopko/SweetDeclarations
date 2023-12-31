//
//  Macros.swift
//

@attached(member, names: arbitrary)
public macro PublicInit() = #externalMacro(module: "SweetDeclarationsPlugin", type: "PublicInitMacro")

@attached(member, names: arbitrary)
public macro PublicInit(escaping: [Any.Type]) = #externalMacro(module: "SweetDeclarationsPlugin", type: "PublicInitMacro")

@attached(member, names: arbitrary)
public macro GranularUpdate() = #externalMacro(module: "SweetDeclarationsPlugin", type: "GranularUpdateMacro")

@attached(member, names: arbitrary)
public macro TestStub() = #externalMacro(module: "SweetDeclarationsPlugin", type: "TestStubMacro")
