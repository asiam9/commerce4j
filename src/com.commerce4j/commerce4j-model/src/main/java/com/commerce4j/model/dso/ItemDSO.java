/**
 * Copyright 2010 Commerce4J.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.commerce4j.model.dso;

import java.util.List;

import com.commerce4j.model.dto.ItemDTO;

/**
 * Item Data Service Object, the business layer that manage 
 * all the item's operations.
 * 
 * @author carlos.quijano
 * @version $Revision$ $Date$
 */
public interface ItemDSO {
	
	/**
	 * @param itemId
	 * @return
	 */
	public ItemDTO findById(Integer itemId);
	
	/**
	 * Find All Items for a particular category.
	 * 
	 * @param categoryId The category primary key.
	 * @return The requested Item list or <code>null</code>. 
	 */
	public List<ItemDTO> findAllByCategory(Integer categoryId);
	
	
	/**
	 * Find All Last Added Items.
	 * 
	 * @param categoryId The category primary key.
	 * @return The requested Item list or <code>null</code>. 
	 */
	public List<ItemDTO> findAllByLastAddition(Integer categoryId, Integer max, Integer first);
	
}
