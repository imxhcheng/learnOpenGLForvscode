#version 330 core
out vec4 FragColor;
in vec3 ourColor;
in vec2 TexCoord;

uniform sampler2D texture1;

// 读取单通道至 r，将 g 和 b 通道设置为何 r 通道一致
void ConvertGray8 () 
{
        vec3 rgb;
        rgb.x = texture(texture1, TexCoord).r;
        rgb.y = rgb.x;
        rgb.z = rgb.x;
        FragColor = vec4(rgb, 1);
}

void main() {

  ConvertGray8();
}