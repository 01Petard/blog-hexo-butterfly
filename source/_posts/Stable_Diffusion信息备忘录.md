---
title: Stable_Diffusion信息备忘录
date: 2023-06-27 20:37:00
updated: 2024-10-27 15:24:00
categories: 
- 其他
tags: 
- StableDiffusion
keywords:
- StableDiffusion
description: 网络拉屎是这样的。
cover: https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/202410271525363.webp
top_img: https://www.shutterstock.com/image-photo/text-word-memorandum-brown-wooden-260nw-1905010969.jpg
---

### 返回信息的域名

> [https://www.paddlepaddle.org.cn/paddle/visualdl/service/server/](https://www.paddlepaddle.org.cn/paddle/visualdl/service/server/)

会返回以下信息：

`{"code":"000000","msg":"hello world!"}`

### 画图提示词

> <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/3aa78ec6a51b882cf06ee69ae7c3f88a8aee3017.jpg@1256w_!web-article-pic.webp" alt="img" style="zoom: 67%;" />
>
> `正向Prompt`
>
> ```
> Best quality, masterpiece, ultra high res, (photorealistic:1.4), raw photo, 1girl, in the dark, deep shadow, low key, cold light
> ```
>
> `反向Prompt`
>
> ```
> ng_deepnegative_v1_75t, badhandv4 (worst quality:2), (low quality:2), (normal quality:2), lowres, bad anatomy, bad hands, normal quality, ((monochrome)), ((grayscale))
> ```
>

> <img src="https://cdn.jsdelivr.net/gh/01Petard/imageURL@main/img/cab21a9d282acc94a857a41576a5d882dfdfbdbe.jpg@1256w_!web-article-pic.webp" alt="img" style="zoom:67%;" />
>
> `正向Prompt`
>
> ```
> Best quality, masterpiece, ultra high res, (photorealistic:1.4), 1girl, offshoulder, deep shadow, shiny skin
> ```
>
> `反向Prompt`
>
> ```
> ng_deepnegative_v1_75t, badhandv4, (worst quality:2), (low quality:2), (normal quality:2), lowres, ((monochrome)), ((grayscale)), watermark
> ```
>

泰🔥🌶，当然这些只是[C站](https://civitai.com)的冰山一角而已……

# 通用 Negative Prompts

```
lowers, bad anatomy, bad hands, bad feet, text, error, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, low resolution, grainy, pixelated, oversaturated colors, poor lighting, bad composition, deformed, disfigured, extra limbs, missing limbs, mutated, unnatural body shape, missing face, double face, badly drawn face, asymmetrical eyes, extra fingers, poorly defined features, cartoonish, anime, childish, old-fashioned, low-poly, robotic, creepy, doll-like
```

# 赛博雨夜

## Positive Prompts

```
((best quality)), ((masterpiece)) , ((ultra-detailed)), (illustration), (detailed light), (an extremely delicate and beautiful), ((1girl)), ((solo)), (beautiful detailed eyes), shiny hair,(((cyberpunk city))), light pollution, ((leotard)), rainy night, wet, (((cropped shoulders))), depth of field, extremely detailed CG unity 8k wallpaper, black long hair, cute face, adult girl, happy, skirt dress, flower pattern in dress, solo, gown, art of light novel, in field, full body, nsfw
```

## Negative Prompts

```
ugly,lowres, bad anatomy, bad hands, text,error, missing fngers,extra digt ,fewer digits,cropped, wort quality ,low quality,normal quality, jpeg artifacts,signature,watermark, username, blurry, bad feet​​lowres, bad anatomy, bad hands, text,error, missing fngers,extra digt ,fewer digits,cropped, wort quality ,low quality,normal quality, jpeg artifacts,signature,watermark, username, blurry, bad feet,disfigured,poorly drawn face,(((long neck))) 
```

##  Other Params

```
Steps: 28, Sampler: Euler a, CFG scale: 7, Seed: 3632138942, Size: 1280x448, Model hash: 925997e9, Clip skip: 2, ENSD: 31337
```

# 幻星耀梦

## Positive Prompts

```
((panorama)),oil painting,best quality,extremely detailed CG unity 8k wallpaper,(masterpiece),(amazing)((dreamlike and picturesque)),dreamy,((unreal)),((((in the dreamy sky with blue-pink clouds)))),there are some stars in the sky,a glass-like lake,((a big blue meteor streaked across the sky and fall into the lake)) 
```

## Negative Prompts

```
((land)),(mountain),((plant)),((tree))
```

##  Other Params

```
Steps:20, Sampler: DPM2 a Karras, CFG scale: 7, Seed: 318503494, Size: 1024x512, Model hash: e6e8e1fc, Clip skip: 2
```

