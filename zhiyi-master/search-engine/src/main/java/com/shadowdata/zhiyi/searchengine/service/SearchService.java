package com.shadowdata.zhiyi.searchengine.service;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SearchService {


    @HystrixCommand(fallbackMethod = "searchFallback")
    public List<String> search(String key) {
        return new ArrayList<>();
    }

    /**
     * 熔断回调
     *
     * @return
     */
    public String searchFallback() {
        return "error";
    }

}
