package com.ship.util;

import java.util.List;

import com.ship.domain.BoardFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardFileListVO {
	private List<BoardFile> items;

}
