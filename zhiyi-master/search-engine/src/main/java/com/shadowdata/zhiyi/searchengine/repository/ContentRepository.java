package com.shadowdata.zhiyi.searchengine.repository;

import com.shadowdata.zhiyi.searchengine.bean.Content;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContentRepository extends JpaRepository<Content, Integer> {


}
