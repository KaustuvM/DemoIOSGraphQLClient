// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetFruitsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFruits {
      fruits {
        __typename
        id
        title
        headline
        image
        gradientColors
        description
        sectionHeaders
        sectionContents
        nutrition
      }
    }
    """

  public let operationName: String = "GetFruits"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("fruits", type: .list(.object(Fruit.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fruits: [Fruit?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "fruits": fruits.flatMap { (value: [Fruit?]) -> [ResultMap?] in value.map { (value: Fruit?) -> ResultMap? in value.flatMap { (value: Fruit) -> ResultMap in value.resultMap } } }])
    }

    public var fruits: [Fruit?]? {
      get {
        return (resultMap["fruits"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Fruit?] in value.map { (value: ResultMap?) -> Fruit? in value.flatMap { (value: ResultMap) -> Fruit in Fruit(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Fruit?]) -> [ResultMap?] in value.map { (value: Fruit?) -> ResultMap? in value.flatMap { (value: Fruit) -> ResultMap in value.resultMap } } }, forKey: "fruits")
      }
    }

    public struct Fruit: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Fruit"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("headline", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("gradientColors", type: .list(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("sectionHeaders", type: .list(.scalar(String.self))),
          GraphQLField("sectionContents", type: .list(.scalar(String.self))),
          GraphQLField("nutrition", type: .list(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, headline: String? = nil, image: String? = nil, gradientColors: [String?]? = nil, description: String? = nil, sectionHeaders: [String?]? = nil, sectionContents: [String?]? = nil, nutrition: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Fruit", "id": id, "title": title, "headline": headline, "image": image, "gradientColors": gradientColors, "description": description, "sectionHeaders": sectionHeaders, "sectionContents": sectionContents, "nutrition": nutrition])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var headline: String? {
        get {
          return resultMap["headline"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "headline")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var gradientColors: [String?]? {
        get {
          return resultMap["gradientColors"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "gradientColors")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var sectionHeaders: [String?]? {
        get {
          return resultMap["sectionHeaders"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "sectionHeaders")
        }
      }

      public var sectionContents: [String?]? {
        get {
          return resultMap["sectionContents"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "sectionContents")
        }
      }

      public var nutrition: [String?]? {
        get {
          return resultMap["nutrition"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "nutrition")
        }
      }
    }
  }
}

public final class GetFruitByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFruitById($fruitId: ID!) {
      fruit(id: $fruitId) {
        __typename
        id
        title
        headline
        image
        gradientColors
        description
        sectionHeaders
        sectionContents
        nutrition
      }
    }
    """

  public let operationName: String = "GetFruitById"

  public var fruitId: GraphQLID

  public init(fruitId: GraphQLID) {
    self.fruitId = fruitId
  }

  public var variables: GraphQLMap? {
    return ["fruitId": fruitId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("fruit", arguments: ["id": GraphQLVariable("fruitId")], type: .object(Fruit.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fruit: Fruit? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "fruit": fruit.flatMap { (value: Fruit) -> ResultMap in value.resultMap }])
    }

    public var fruit: Fruit? {
      get {
        return (resultMap["fruit"] as? ResultMap).flatMap { Fruit(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "fruit")
      }
    }

    public struct Fruit: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Fruit"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("headline", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("gradientColors", type: .list(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("sectionHeaders", type: .list(.scalar(String.self))),
          GraphQLField("sectionContents", type: .list(.scalar(String.self))),
          GraphQLField("nutrition", type: .list(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, headline: String? = nil, image: String? = nil, gradientColors: [String?]? = nil, description: String? = nil, sectionHeaders: [String?]? = nil, sectionContents: [String?]? = nil, nutrition: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Fruit", "id": id, "title": title, "headline": headline, "image": image, "gradientColors": gradientColors, "description": description, "sectionHeaders": sectionHeaders, "sectionContents": sectionContents, "nutrition": nutrition])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var headline: String? {
        get {
          return resultMap["headline"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "headline")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var gradientColors: [String?]? {
        get {
          return resultMap["gradientColors"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "gradientColors")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var sectionHeaders: [String?]? {
        get {
          return resultMap["sectionHeaders"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "sectionHeaders")
        }
      }

      public var sectionContents: [String?]? {
        get {
          return resultMap["sectionContents"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "sectionContents")
        }
      }

      public var nutrition: [String?]? {
        get {
          return resultMap["nutrition"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "nutrition")
        }
      }
    }
  }
}
