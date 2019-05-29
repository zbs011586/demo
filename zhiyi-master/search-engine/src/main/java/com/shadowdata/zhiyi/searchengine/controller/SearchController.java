package com.shadowdata.zhiyi.searchengine.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/search")
public class SearchController {
    Logger logger = LoggerFactory.getLogger(SearchController.class);

    @GetMapping("/v1/{key}")
    public ResponseEntity search(@PathVariable(value = "key") String key) {
        logger.info("收到搜索请求：" + key);
        logger.debug("收到搜索请求，请求参数是:" + key);
        return new ResponseEntity("you are searching:" + key, HttpStatus.OK);

    }
}
