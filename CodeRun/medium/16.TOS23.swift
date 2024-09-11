//
//  16.TOS23.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 31.08.2024.
//

import Foundation

// 16. TOS23

import Foundation

func readUInt32(from data: Data, at offset: Int) -> UInt32 {
    return UInt32(data[offset])
//    |
//           UInt32(data[offset + 1]) << 8 |
//           UInt32(data[offset + 2]) << 16 |
//           UInt32(data[offset + 3]) << 24
}

func checkFileSystem(file: String) {
    guard let fileHandle = FileHandle(forReadingAtPath: file) else {
        
        print("Failed to open file")
        return
    }
    
    defer {
        fileHandle.closeFile()
    }
    
    let fileSize = try! FileManager.default.attributesOfItem(atPath: file)[.size] as! Int
    var visitedBlocks = Set<Int>()
    var currentBlockIndex = 0
    var totalVisitedBytes = 0
    
    while !visitedBlocks.contains(currentBlockIndex) {
        visitedBlocks.insert(currentBlockIndex)
        
        // Move the file pointer to the start of the current block
        fileHandle.seek(toFileOffset: UInt64(currentBlockIndex))
        
        // Read 4 bytes for the data section size
        guard let sizeData = try? fileHandle.read(upToCount: 4), sizeData.count == 4 else {
            print("Failed to read data size")
            return
        }
        print("sizeData:", sizeData)
        let dataSize = Int(readUInt32(from: sizeData, at: 0))
        print(dataSize)
        // Calculate the total size of the block (4 bytes size + dataSize + 4 bytes next block index)
        let blockSize = 4 + dataSize + 4
        
        // Read the full block including the data section and the next block index
        fileHandle.seek(toFileOffset: UInt64(currentBlockIndex))
        guard let blockData = try? fileHandle.read(upToCount: blockSize), blockData.count == blockSize else {
            print("Failed to read block data")
            return
        }
        
        // Extract the next block index
        let nextBlockIndex = Int(readUInt32(from: blockData, at: 4 + dataSize))
        
        totalVisitedBytes += blockSize
        
        // Move to the next block
        currentBlockIndex = nextBlockIndex
    }
    
    // Check if we returned to the first block
    if currentBlockIndex != 0 {
        print("not a ring buffer")
        return
    }
    
    // Check for data loss
    if totalVisitedBytes != fileSize {
        print("data loss")
    } else {
        print("OK")
    }
}

// Example usage
let filename = "sample.taf23" // Change this to the actual filename




