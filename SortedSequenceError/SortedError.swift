//
//  SortedError.swift
//  SortedSequenceError
//
//  Created by Matt Kiazyk on 2022-10-25.
//

import Foundation

public struct FacultyMember: Equatable, Codable, Identifiable {
    public var id: String
    public var isPrimary: Bool
    public var firstName: String
    public var lastName: String
    
}

public extension Array where Element == FacultyMember {
    /// Applies the default facultyMember sort to the given array
    /// 1) IsPrimary
    /// 2) FirstName, then LastName
    /// - Returns: Sorted [FacultyMember]
    func sortedByPrimaryFirstNameLastName() -> [FacultyMember] {
        sorted {
            guard $0.isPrimary == $1.isPrimary else {
                return $0.isPrimary > $1.isPrimary
            }

            return $0.lastName.localizedCaseInsensitiveCompare($1.lastName) == .orderedAscending
        }
    }
}
