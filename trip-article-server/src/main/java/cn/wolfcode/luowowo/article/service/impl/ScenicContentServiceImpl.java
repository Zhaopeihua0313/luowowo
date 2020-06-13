package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ScenicContent;
import cn.wolfcode.luowowo.article.mapper.ScenicContentMapper;
import cn.wolfcode.luowowo.article.service.IScenicContentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ScenicContentServiceImpl implements IScenicContentService {

    @Autowired
    private ScenicContentMapper scenicContentMapper;

    public ScenicContent get(Long scenicId) {
        return scenicContentMapper.get(scenicId);
    }
}
